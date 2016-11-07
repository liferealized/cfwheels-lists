<cfoutput>
  <tr>
    <cfloop index="loc.x" from="1" to="#ArrayLen(loc.properties)#">
      <td class="#hyphenize(loc.properties[loc.x])#">
        <cfif loc.x eq 1 and loc.allowEdit>
          <cfif StructKeyExists(variables, "format#loc.modelName##loc.properties[loc.x]#")>
            #$invoke(method="format#loc.modelName##loc.properties[loc.x]#", argumentCollection=loc, value=loc[loc.properties[loc.x]])#
          <cfelse>
            #linkTo(route="edit#singularize(loc.route)#", key=loc[loc.model.primaryKey()], text=loc[loc.properties[loc.x]], argumentCollection=loc.linkToArgs)#
          </cfif>
        <cfelse>
          <cfif StructKeyExists(variables, "format#loc.modelName##loc.properties[loc.x]#")>
            #$invoke(method="format#loc.modelName##loc.properties[loc.x]#", argumentCollection=loc, value=loc[loc.properties[loc.x]])#
          <cfelse>
            #loc[loc.properties[loc.x]]#
          </cfif>
        </cfif>
      </td>
    </cfloop>
    <cfif StructKeyExists(variables, "format#loc.modelName#ActionLinks") or loc.allowEdit or loc.allowDelete>
      <td class="action-links">
        <cfif StructKeyExists(variables, "format#loc.modelName#ActionLinks")>
          #$invoke(method="format#loc.modelName#ActionLinks", argumentCollection=arguments)#
        <cfelseif loc.allowEdit>
          #linkTo(route="edit#singularize(loc.route)#", key=loc.id, text="Edit", class="btn btn-mini edit", argumentCollection=loc.linkToArgs)#
        </cfif>

        <cfif loc.allowDelete and not StructKeyExists(variables, "format#loc.modelName#ActionLinks")>
          #linkTo(route=singularize(loc.route), method="delete", params="_method=delete", key=loc.id, text="Delete", class="btn btn-mini delete", argumentCollection=loc.linkToArgs)#
        </cfif>
      </td>
    </cfif>
  </tr>
</cfoutput>
