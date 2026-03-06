import axios from 'axios';
import fs from 'fs';
import path from 'path';
import FormData from 'form-data';


// Environment Variables:
// CB_API_KEY: The API key for accessing Codeberg.

// TODO: change this to match
const repoUrl = 'https://codeberg.org/api/v1/repos/threadpanic/cb-src-woodpecker';




// Extract the first command-line argument and assign to 'version'
const version = process.argv[2];
if (!version) {
    console.error('Please provide the version as the first command-line argument.');
    process.exit(1);
}

// Extract the second command-line argument and assign to 'ci_build_number'
const ci_build_number = process.argv[3];
if (!ci_build_number) {
    console.error('Please provide the ci_build_number as the second command-line argument.');
    process.exit(1);
}

const tarball_artifact = `librewolf-${version}.source.tar.gz`;
const sha256sum_artifact = `${tarball_artifact}.sha256sum`;
const sha512sum_artifact = `${tarball_artifact}.sha512sum`;
const tarballExists = fs.existsSync(path.join('..', tarball_artifact));
const sha256sumExists = fs.existsSync(path.join('..', sha256sum_artifact));
const sha512sumExists = fs.existsSync(path.join('..', sha512sum_artifact));

if (!tarballExists || !sha256sumExists || !sha512sumExists) {
    console.error(`Missing artifacts. Ensure both ${tarball_artifact}, ${sha256sum_artifact} and ${sha512sum_artifact} are present in the parent directory.`);
    process.exit(1);
}

const apiKey = process.env.CB_API_KEY;

if (!apiKey) {
    console.error('API key not found in environment variable CB_API_KEY.');
    process.exit(1);
}

const headers = {
    'Authorization': `Bearer ${apiKey}`
};

async function addReleaseArtifact(fileName: string, releaseId: number) {
    const apiUrl = `${repoUrl}/releases/${releaseId}/assets?name=${fileName}`;
    const formData = new FormData();
    formData.append('attachment', fs.createReadStream(path.join('..', fileName)));

    try {
        const response = await axios.post(apiUrl, formData, {
            headers: {
                ...headers,
                ...formData.getHeaders()
            }
        });

        if (response.status !== 201) {
            throw new Error(`Failed to attach artifact ${fileName}. Unexpected response status: ${response.status}`);
        }
    } catch (error: any) {
        console.error(`Error while attaching artifact ${fileName}:`, error.response ? error.response.data : error.message);
        throw error;
    }
}

async function createNewRelease() {
    console.log(`Creating new release v${version}...`);
    const releaseUrl = `${repoUrl}/releases`;
    const requestBody = {
        body: `Please see the README.md file for compilation instructions and dependency details.

* [${tarball_artifact}](https://storage.ci.librewolf.net/artifacts/${ci_build_number}/librewolf-${version}.source.tar.gz)
* [${sha256sum_artifact}](https://storage.ci.librewolf.net/artifacts/${ci_build_number}/librewolf-${version}.source.tar.gz.sha256sum)
* [${sha512sum_artifact}](https://storage.ci.librewolf.net/artifacts/${ci_build_number}/librewolf-${version}.source.tar.gz.sha512sum)

Note: these artifacts don't have a long shelflife on our current s3 server, but it demonstrates the use of exernal storage to store big artifacts.
`,
        draft: false,
        name: `Release ${version}`,
        prerelease: false,
        tag_name: `v${version}`
    };

    try {
        const response = await axios.post(releaseUrl, requestBody, { headers: headers });

        if (response.status === 201) {
            // await addReleaseArtifact(tarball_artifact, response.data.id);
            await addReleaseArtifact(sha256sum_artifact, response.data.id);
            await addReleaseArtifact(sha512sum_artifact, response.data.id);
            console.log(`Successfully built release: ${releaseUrl}`);
        } else {
            throw new Error(`Failed to create release. Unexpected response status: ${response.status}`);
        }
    } catch (error: any) {
        console.error("Error while creating release:", error.response ? error.response.data : error.message);
        throw error;
    }
}

async function main() {
    try {
        const releaseListResponse = await axios.get(`${repoUrl}/releases`);

        if (releaseListResponse.data.length === 0) {
            await createNewRelease();
        } else {
            const latestReleaseResponse = await axios.get(`${repoUrl}/releases/latest`);
            if (latestReleaseResponse.data.tag_name === `v${version}`) {
                console.log(`Version v${version} already exists as a release. Exiting without creating a new release.`);
                process.exit(0);
            }
            await createNewRelease();
        }
        process.exit(0);
    } catch (error: any) {
        console.error('Error while processing releases:', error);
        process.exit(1);
    }
}

main();

