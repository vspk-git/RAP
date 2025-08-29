@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Schedule consumption view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define view entity ZSP_SCHEDULE_C as projection on ZSP_SCHEDULE_I
{
    key So,
    key Item,
    key slno,
    ScheduleCat,
    DelivDate,
    @Semantics.quantity.unitOfMeasure: 'SaleUnit'
    OrderQty,
    @Semantics.quantity.unitOfMeasure: 'SaleUnit'
    ConfirmedQty,
    SaleUnit,
    LocalLastChangedAt,
    /* Associations */
    _HEADER:redirected to ZSP_HEADER_C,
    _ITEM: redirected to parent ZSP_ITEM_C
}
