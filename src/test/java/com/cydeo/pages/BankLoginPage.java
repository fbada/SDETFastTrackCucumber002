package com.cydeo.pages;

import com.cydeo.utilities.Driver;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import java.util.Collection;

public class BankLoginPage {

        public BankLoginPage(){

            PageFactory.initElements( Driver.getDriver(),this);
        }


        @FindBy(name="username")
        WebElement userName;

        @FindBy(name="password")
        WebElement password;

        @FindBy(css = "button[type='submit']")
        WebElement submit;

        @FindBy(xpath = "//p[contains(text(),'Incorrect')]")
        public WebElement errorMessage;

    public void navigateToLoginPage() {
        Driver.getDriver ().get("https://practicetestautomation.com/practice-test-login/"); // Replace with the actual URL of the login page
    }

        public void setUserName(String strUserName){
            userName.sendKeys(strUserName);
        }

        public void setPassword(String strPassword){
            password.sendKeys(strPassword);
        }

        public void clickLogin(){
            submit.click();
        }


}

