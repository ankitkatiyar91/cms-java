${parameters.after?if_exists}<#t/>
   <#lt/>
</div>
<#if parameters.errorposition?default("top") == 'bottom'>
<#assign hasFieldErrors = parameters.name?? && fieldErrors?? && fieldErrors[parameters.name]??/>
<#if hasFieldErrors>
<#list fieldErrors[parameters.name] as error>
        <span errorFor="${parameters.id}" class="errorMessage">${error?html}</span><#t/>
        <#lt/>
</div>
</#list>
</#if>
</#if>

