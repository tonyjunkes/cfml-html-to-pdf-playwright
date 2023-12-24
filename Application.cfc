component {
    static {
        OUTPUT_PATH = expandPath("./output")
    }

    this.name = "playwright" & hash(getBaseTemplatePath());
    this.applicationTimeout = createTimeSpan(0, 2, 0, 0);
    this.javaSettings = {
        loadPaths: directoryList(expandPath("/lib"), true, "path", "*.jar"),
        loadColdFusionClassPath: true
    };
    this.mappings = {
        "/output": static.OUTPUT_PATH
    };

    public boolean function onApplicationStart() {
        if (!directoryExists(static.OUTPUT_PATH)) {
            directoryCreate(static.OUTPUT_PATH);
        }

        return true;
    }
}
