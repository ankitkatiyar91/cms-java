<#--
	Only show message if errors are available.
	This will be done if ActionSupport is used.
-->
<#assign hasFieldErrors = parameters.name?? && fieldErrors?? && fieldErrors[parameters.name]??/>
<#if parameters.errorposition?default("top") == 'top'>
<#if hasFieldErrors>
<#list fieldErrors[parameters.name] as error>
<tr errorFor="${parameters.id}">
    <td align="center" valign="top" colspan="2"><#rt/>
        <span class="errorMessage">${error?html}</span><#t/>
    </td><#lt/>
</tr>
</#list>
</#if>
</#if>
<#--
	if the label position is top,
	then give the label it's own row in the table
-->
<div
<#if hasFieldErrors>
class="form-group has-error"
<#else>
class="form-group"
</#if>
>
<#--<#if parameters.labelposition?default("") == 'top'>
    <dic align="left" valign="top" colspan="2"><#rt/>
<#else>
    <td class="tdLabel"><#rt/>
</#if> -->
<#if parameters.label??>
    <label <#t/>
<#if parameters.id??>
        for="${parameters.id?html}" <#t/>
</#if>
<#if hasFieldErrors>
        class="control-label"<#t/>
<#else>
        class="control-label"<#t/>
</#if>
    ><#t/>
<#if parameters.required?default(false) && parameters.requiredPosition?default("right") != 'right'>
        <span class="required">*</span><#t/>
</#if>
${parameters.label?html}<#t/>
<#if parameters.required?default(false) && parameters.requiredPosition?default("right") == 'right'>
 <span class="required">*</span><#t/>
</#if>
${parameters.labelseparator?default(":")?html}<#t/>
<#include "/${parameters.templateDir}/${parameters.expandTheme}/tooltip.ftl" />
</label><#t/>
</#if>
    </td><#lt/>
<#-- add the extra row -->
<#if parameters.labelposition?default("") == 'top'>
</div>
</#if>