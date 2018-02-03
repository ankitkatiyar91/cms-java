<%@include file="../header-includes.jsp"%>
<s:head/>
<s:url var="assignRolePermissions" action="assignRolePermissions" forceAddSchemeHostAndPort="true" namespace="/cpanel" ></s:url>
<div class="modal-header">
	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	<h4 class="modal-title" id="myModalLabel">Assign permissions to	${role.name} role</h4>
</div>

<script type="text/javascript" >
$(document).ready(function(){
	$("#submit_assignpermission").click(function(){
		//submitForm();		
		$("#assignPermisison_from_perm option").each(function() {
				$(this).attr('selected', true);
		});
			$.ajax({
				type : "POST",
				url : "${assignRolePermissions}",
				data : $('form.contact').serialize(),
				beforeSend:function(msg) {
					//console.log($('form.contact').serialize());
					$("#modal-content").html('<p class="bg-success" style="padding: 10px;">Please wait saving</p>');
					},
				success : function(msg) {
					if(msg.Result=='OK'){
					$("#modal-content").html('<p class="bg-success" style="padding: 10px;">Saved <button style="float:right;" type="button" class="btn btn-default" data-dismiss="modal">Close</button></p>');
					$("#assignPermissionModel").modal('hide');
					}else{
						$("#modal-content").html('<p class="bg-success" style="padding: 10px;">'+msg.Result+'</p>');
					}	
				},
				error : function() {
					$("#modal-content").html('<p class="bg-danger" style="padding: 10px;">Unable to process</p>');
				}
			});
		});
	});
</script>

<div class="modal-body">
	<s:form action="assignRolePermissions" id="assignPermisison_from" cssClass="contact" >
		<s:hidden name="roleId" value="%{role.roleId}" ></s:hidden>
		<s:optiontransferselect theme="xhtml" 
			tooltip="Select Permissions to be assigned to this role. Right side represents selected permissions"
			label="Select Permissions" name="allperm"
			leftTitle="Available Permissions" rightTitle="Assigned Permissions"
			list='%{permissions}' listKey="id" listValue="name" multiple="true"
			emptyOption="false" doubleList="%{role.permissions}"
			doubleName="perm" doubleListKey="id" doubleListValue="name" 
			allowUpDownOnLeft="false" allowUpDownOnRight="false"
			doubleMultiple="true" />
	</s:form>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	<button type="button" 
		id="submit_assignpermission" class="btn btn-primary">Save
		changes</button>
</div>

