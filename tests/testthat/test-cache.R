test_that("cache keys are version-specific", {
    url_old <- "https://zenodo.org/records/13997429/files/bugsigdb.gmt"
    url_new <- "https://zenodo.org/records/19740674/files/bugsigdb.gmt"
    # Different resource versions (urls) must not share a cache entry
    expect_false(identical(
        .resource_rname(url_old, "BugSigDB", "bugsig", "taxid"),
        .resource_rname(url_new, "BugSigDB", "bugsig", "taxid")
    ))
    # The same version must always map to the same cache entry
    expect_identical(
        .resource_rname(url_old, "BugSigDB", "bugsig", "taxid"),
        .resource_rname(url_old, "BugSigDB", "bugsig", "taxid")
    )
})
