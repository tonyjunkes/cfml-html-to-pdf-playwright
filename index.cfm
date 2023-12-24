<cfscript>
	try {
		System = createObject( "java", "java.lang.System" );
		Playwright = createObject("java", "com.microsoft.playwright.impl.PlaywrightImpl");
		PlaywrightOptions = createObject("java", "com.microsoft.playwright.Playwright$CreateOptions");
		PdfOptions = createObject("java", "com.microsoft.playwright.Page$PdfOptions");
		Paths = createObject("java", "java.nio.file.Paths");
		FileOutputStream = createObject("java", "java.io.FileOutputStream");

		System.setProperty("playwright.cli.dir", expandPath("./driver"));

		// Create a new page
		pw = Playwright.create(PlaywrightOptions.init());
		browser = pw.chromium().launch();
		page = browser.newPage();

		html = "<html><body><h1>Hello World!</h1></body></html>";

		// Set the HTML content
		page.setContent(html);

		// EXAMPLE 1:
		// Get the page as ByteArray first.
		// Nice for writing to a stream or appending pages before writing.

		// Generate PDF as ByteArray and save
		pdfBytes = page.pdf();
		fos = FileOutputStream.init(expandPath("/output/example1.pdf"));
		fos.write(pdfBytes);
		fos.close();

		// EXAMPLE 2:
		// Get the page and write.

		// Generate PDF and save
		output = Paths.get(expandPath("/output/example2.pdf"), []);
		page.pdf(PdfOptions.init().setPath(output));
	}
	catch(any e) {
		writeDump(e);
	}
	finally {
		// Close the browser and any open streams
		fos?.close();
		page.close();
		browser.close();
		pw.close();
	}
</cfscript>