
package com.rgn;


public class LoginSignUp {
    public static void main(String[] args) {
        Login_Form login= new Login_Form();
        login.setVisible(true);
        login.pack() ;
        login.setLocationRelativeTo(null) ;
        Registration rgn = new Registration();
        rgn.setVisible(true);
        rgn.pack();
        rgn.setLocationRelativeTo(null);
    }
}
