package com.cydeo.runner;


import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        plugin = {
                "html:target/cucumber-reports.html",
                "me.jvt.cucumber.report.PrettyReports:target/cucumber",
                "rerun:target/rerun.txt"},
        features = "src/test/resources/features",
        glue = "com/cydeo/step_definitions",
        publish = true,
        dryRun = false,
        tags = "@wip"
)
public class CukesRunner {
}
