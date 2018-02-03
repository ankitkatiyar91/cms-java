<#if (actionMessages?? && actionMessages?size > 0 && !parameters.isEmptyList)>
	<div<#rt/>
<#if parameters.id?if_exists != "">
 id="${parameters.id?html}"<#rt/>
</#if>
<#if parameters.cssClass??>
 class="${parameters.cssClass?html}"<#rt/>
<#else>
 class="actionMessage"<#rt/>
</#if>
<#if parameters.cssStyle??>
 style="${parameters.cssStyle?html}"<#rt/>
</#if>
>
		<#list actionMessages as message>
            <#if message?if_exists != "">
                <p class=" text-success" ><#if parameters.escape>${message!?html}<#else>${message!}</#if></p>
            </#if>
		</#list>
	</div>
</#if>