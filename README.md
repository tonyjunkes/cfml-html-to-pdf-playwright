# HTML to PDF Using CFML and Playwright

> NOTE: This is a work in progress, so there are no detailed steps are how to set things up just yet. I am experimenting in hopes of creating a streamlined setup with the help of CommandBox.

Example using [Playwright for Java](https://playwright.dev/java/) to render HTML and write to PDF with CFML.

If you are looking for a full example of using Playwright's testing abilities with your CFML applicaitons, check out the following projects:
* [cbPlaywright](https://github.com/coldbox-modules/cbPlaywright)
* [commandbox-cbplaywright](https://github.com/commandbox-modules/commandbox-cbplaywright)

## Installation

### CommandBox

[CommandBox](https://www.ortussolutions.com/products/commandbox) is the recommended way to run this project's examples.

Launch a terminal pointing at the project root and run `box` to get CommandBox going. Then run `install && start` to pull in the Java dependencies and start the server instance. By default the latest available flavor of Lucee will be used. To switch engines, you may pass in the `cfengine` parameter to CommandBox or update `server.json` in the project root.

### Manual

A list of Java dependencies can be found in `box.json`. Follow the JAR links to manually download the required dependencies. Place those files in `/lib` of the project root. From there you can run the project using the engine of your choice.
