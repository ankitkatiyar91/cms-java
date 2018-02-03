<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlheader.ftl" />

<label<#rt/>
<#if parameters.id??>
 id="${parameters.id?html}"<#rt/>
</#if>
<#-- <#if parameters.cssClass??>
 class="${parameters.cssClass?html}"<#rt/>
</#if> -->
<#if parameters.cssStyle??>
 style="${parameters.cssStyle?html}"<#rt/>
</#if>
<#if parameters.title??>
 title="${parameters.title?html}"<#rt/>
</#if>
<#if parameters.for??>
 for="${parameters.for?html}"<#rt/>
</#if>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/common-attributes.ftl" />
<#include "/${parameters.templateDir}/${parameters.expandTheme}/dynamic-attributes.ftl" />
><#rt/>
<#if parameters.nameValue??>
<@s.property value="parameters.nameValue"/><#t/>
</#if>
</label>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/controlfooter.ftl" />
