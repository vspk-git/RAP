@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Header Instance view'
@Metadata.ignorePropagatedAnnotations: true
@VDM.viewType: #BASIC
define root view entity ZSP_HEADER_I 
  as select from zsp_sales_header
  composition [0..*] of ZSP_ITEM_I as _item
{
    key so                as So,
    customer              as Customer,
    sdtype                as Sdtype,
    salesorg              as Salesorg,
    distributionchannel   as Distributionchannel,
    division              as Division,
    Status                as Status,
    
    @Semantics.user.createdBy: true
    local_created_by      as LocalCreatedBy,
    
    @Semantics.systemDateTime.createdAt: true
    local_created_at      as LocalCreatedAt,
    
    @Semantics.user.lastChangedBy: true
    local_last_changed_by as LocalLastChangedBy,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    
    @Semantics.systemDateTime.lastChangedAt: true 
    last_changed_at       as LastChangedAt,
    
    _item // Make association public
}
