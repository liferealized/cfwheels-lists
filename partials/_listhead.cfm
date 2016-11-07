<cfoutput>
  <cfloop array="#loc.properties#" index="loc.property">
    <th class="#hyphenize(loc.property)#">
      #sortLinkTo(route=loc.route, property=loc.property, modelName=loc.modelName, allowSort=loc.allowSort)#
    </th>
  </cfloop>
  <cfif StructKeyExists(variables, "format#loc.modelName#ActionLinks") or loc.allowEdit or loc.allowDelete>
    <th class="action-links">Modify Record</th>
  </cfif>
</cfoutput>
