package com.cydeo.step_definitions;

import com.cydeo.pages.BankLoginPage;
import com.cydeo.utilities.BrowserUtils;
import com.cydeo.utilities.Driver;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.junit.Assert;

public class SQL_Steps {
    BankLoginPage bankLoginPage = new BankLoginPage();

    @Given("a user navigates to the bank login page")
    public void aUserNavigatesToTheBankLoginPage() {
        bankLoginPage.navigateToLoginPage();
    }

    @When("the user enters {string} as username on the bank login")
    public void theUserEntersAsUsernameOnTheBankLogin(String arg0) {
        bankLoginPage.setUserName(arg0);
    }

    @And("the user enters a random password on the bank site")
    public void theUserEntersARandomPasswordOnTheBankSite() {
        bankLoginPage.setPassword("anypassword");
    }

    @Then("the login should not be successful on the bank site")
    public void theLoginShouldNotBeSuccessfulOnTheBankSite() {
        bankLoginPage.clickLogin();
        BrowserUtils.waitFor(2);
        Assert.assertTrue(bankLoginPage.errorMessage.isDisplayed());
    }

    @And("the system should not return a database error message")
    public void theSystemShouldNotReturnADatabaseErrorMessage() {
        Assert.assertFalse(bankLoginPage.errorMessage.getText().contains("Database"));
        System.out.println (bankLoginPage.errorMessage.getText ());
    }
}
