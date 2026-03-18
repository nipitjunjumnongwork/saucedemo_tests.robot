Appium Mobile Web Automation: SauceDemo (Robot Framework)

1.Appium Server & Drivers Setup
1.1. Install Appium Server
npm install -g appium

1.2 Install UIAutomator2 Driver for Android
appium driver install uiautomator2

1.3 Verify installed drivers
appium driver list --installed

1.4 Install Python Libraries
pip install robotframework
pip install robotframework-appiumlibrary

1.5 Install Android Studio & SDK
Android Studio is required to manage Android SDK and Emulators (AVD).
Download and install Android Studio.
Android SDK: During installation, ensure Android SDK, Android SDK Platform-Tools, and Android SDK Build-Tools are installed via the SDK Manager.
Environment Variables: Add the following to your system's PATH:
ANDROID_HOME: Path to your SDK (e.g., C:\Users\YourName\AppData\Local\Android\Sdk)
Add %ANDROID_HOME%\platform-tools and %ANDROID_HOME%\emulator to your System PATH.

1.6 Setup Android Emulator (AVD)
Open Android Studio -> Device Manager.
Create a Virtual Device (e.g., Pixel 7) with a system image that includes Google Play Store (to ensure Chrome is available).
Start the emulator before running the tests.

2.Tech Stack

2.2 Language: Python 3.x
2.3 Framework: Robot Framework
2.4 Automation Tool: Appium / AppiumLibrary
2.5 Target: Mobile Web Browser (Android Chrome)

3.How to Run
3.1 Start the Appium Server: appium

Run the Robot Framework test: saucedemo_tests.robot



