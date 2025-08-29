@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item consumption view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define view entity ZSP_ITEM_C as projection on ZSP_ITEM_I
{
    key So,
    key Item,
    Material,
    Materialgroup,
    Plant,
    Sloc,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Netprice,
    CurrencyCode,
    @Semantics.quantity.unitOfMeasure: 'Salesunit'
    Quantity,
    Salesunit,
    LocalLastChangedAt,
    /* Associations */
    _header:redirected to parent ZSP_HEADER_C,
    _schedule: redirected to composition child ZSP_SCHEDULE_C
}
