@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header consumption view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@VDM.viewType: #CONSUMPTION
define root view entity ZSP_HEADER_C provider contract transactional_query as projection on ZSP_HEADER_I
{
    key So,
    Customer,
    Sdtype,
    Salesorg,
    Distributionchannel,
    Division,
    Status,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    /* Associations */
    _item:redirected to composition child ZSP_ITEM_C
}
