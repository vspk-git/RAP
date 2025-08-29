@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Item instance view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZSP_ITEM_I as select from zsp_sales_item
  composition [0..*] of ZSP_SCHEDULE_I as _schedule
  
  association to parent ZSP_HEADER_I as _header on $projection.So = _header.So
  
{
    key so                as So,
    key item              as Item,
    material              as Material,
    materialgroup as Materialgroup,
    plant                 as Plant,
    sloc                  as Sloc,
    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    netprice              as Netprice,
    
    currency_code         as CurrencyCode,
    
    @Semantics.quantity.unitOfMeasure: 'Salesunit'
    quantity              as Quantity,
    
    salesunit             as Salesunit,
    
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
   
     _header,
     _schedule
    
}
