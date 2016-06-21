package com.skg

class Transfers {
    String txnId
    String status
    String currency
    BigDecimal amount
    BigDecimal fee
    String created
    String fundingSourceId
    String destinationId

    static constraints = {
    }
}
