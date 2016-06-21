package com.skg

class Customer {

    String firstName
    String lastName
    String email
    String ipAddress
    String type
    String address1
    String address2
    String city
    String state
    String postalCode
    String dateOfBirth
    String ssn
    String phone
    Boolean verified = Boolean.FALSE

    static constraints = {
        type nullable: true
        address1 nullable: true
        address2 nullable: true
        city nullable: true
        state nullable: true
        postalCode nullable: true
        dateOfBirth nullable: true
        ssn nullable: true
        phone nullable: true
    }
}
