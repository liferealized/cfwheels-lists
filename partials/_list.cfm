<cfoutput>
  <div id="#loc.modelName#-listing">
    #includePartial(partial=loc.searchPartial, argumentCollection=loc)#
    <table class="#loc.settings.tc#">
      <thead>
        <tr>
          #includePartial(partial=loc.listHeadPartial, argumentCollection=loc)#
        </tr>
      </thead>
      <tbody>
        <cfif loc.collection.RecordCount>
          #includePartial(partial=loc.listItemPartial, query=loc.collection, argumentCollection=loc)#
        <cfelse>
          #includePartial(partial=loc.noListPartial, argumentCollection=loc)#
        </cfif>
      </tbody>
    </table>
    <cfif loc.doPagination>
      #includePartial(partial=loc.paginationPartial, argumentCollection=loc)#
    </cfif>
  </div>
</cfoutput>
