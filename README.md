<p  align="center">
<a  href="https://flutter.dev"  target="_blank"><img  height="60"  src="https://static.wikia.nocookie.net/logo-timeline/images/c/cf/4B4A9751-D2BF-4A93-BDCC-CDCA5326B65F.png/revision/latest/scale-to-width-down/1124?cb=20210426191500"  alt="Flutter Logo"></a> <a>&nbsp;&nbsp;&nbsp;</a>
<a  href="https://appwrite.io"  target="_blank"><img  width="260"  height="39"  src="https://appwrite.io/images/logos/appwrite.svg"  alt="Appwrite Logo"></a>
<hr>
<img  height="200"   src="assets/logo/gitsafari_logo.png"  alt="Git Safari Logo">    
</p>

# Git Safari

An app made to explore and find new GitHub repositories.

## Features

- Search and add GitHub Repositories of you liking with an in-app search feature.
- See relevant resources based on the majority language used in the project.
- (Add more features in this list)
## Installation

### Appwrite

Appwrite backend server is designed to run in a container environment. Running your server is as easy as running one command from your terminal. You can either run Appwrite on your localhost using docker-compose or on any other container orchestration tool like Kubernetes, Docker Swarm or Rancher.

### Flutter

To build and run this project:

1. Get Flutter [here](https://docs.flutter.dev/get-started/install) if you don't already have it
2. Clone this repository
3. `cd` into the repo folder
4. Run `flutter pub get` to get the dependencies
5. Run `flutter run-android` or `flutter run-ios` to build the app

(Please note that a Mac with XCode is required to build for iOS)

## Setting up appwrite project

We are going to use Appwrite CLI to init the project on appwrite console.

## Install Appwrite CLI

The CLI is packaged both as an [npm module](https://www.npmjs.com/package/appwrite-cli) as well as a [standalone binary](https://github.com/appwrite/sdk-for-cli/releases/latest) for your operating system, making it completely dependency free, platform independent and language agnostic.

## Install with NPM

If you have npm set up, run the command below to install the CLI

Prerequisites : [Node.js (for npm)](https://nodejs.org/en/download)

```bash
npm install -g appwrite-cli
```


After the installation is complete, verify the install using

```cli
appwrite -v
```

## Setup the project using Appwrite CLI

Before you can use the CLI, you need to login to your Appwrite account using

```cli
appwrite login
```

After you're logged in, the CLI needs to be initialized with your Appwrite project. You can initialize the CLI using:

```cli
appwrite init project
```

Choose `Create a new Appwrite project` and the following prompts will guide you through the setup process, enter `gitsafari` as the ID for your new project. The init command also creates an **appwrite.json** file representing your Appwrite project.

Create a new database

```cli
appwrite databases create --databaseId postdatabase --name posts
```

Create a new collection

```cli
appwrite databases createCollection --databaseId postdatabase --collectionId postcollection --name posts --permissions 'read(\"any\")' 'write(\"any\")'
```

Create `username` attribute

```cli
appwrite databases createStringAttribute --databaseId postdatabase --collectionId postcollection --key username --size 255 --required true
```

Create `caption` attribute

```cli
appwrite databases createStringAttribute --databaseId postdatabase --collectionId postcollection --key caption --size 255 --required true
```

Create `imageId` attribute

```cli
appwrite databases createStringAttribute --databaseId postdatabase --collectionId postcollection --key imageId --size 255 --required true
```

Create a bucket to store post images

```cli
appwrite storage createBucket --bucketId imagesbucket --name images --permissions 'read(\"any\")' 'write(\"any\")'
```

## `lib/consts/constants.dart`

You may need to make some changes in `lib/consts/constants.dart`:

**APPWRITE_URL**: This is the endpoint URL. If you are testing the app on an android studio emulator and appwrite is configured on cloud.appwrite.io, then you don't need to change it. Otherwise, you will need to change the hostname to the URL that you set while initiating appwrite.

Rest of the `constants.dart` should be left as it is.

## Register the client on your dashboard

Finally, you need to register the flutter app. On appwrite console (http://localhost), choose this project, then under "Platforms" head, choose "Add Platform", choose "New Flutter App", and add the required information for all the platforms you are going to run the app.

**Now your Project is ready to run.**

## File Structure

```bash
.
├── android # android files (auto generated)
├── assets # assets (images)
├── ios # ios files (auto generated)
└── lib
    ├── api # Logic for handling Appwrite and GitHub APIs
    ├── models # Custom Models
    ├── screens # Various Screens of the App
    │   └── home_tabs # Tabs for home screen
    ├── utils # Api info and Local DB Logic
    └── widgets # Custom widgets
```
