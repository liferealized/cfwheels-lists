<cfoutput>
  <cfif loc.allowSearch>
    <div class="search">
      #startFormTag(route=loc.route, method="get", class="form-search", argumentCollection=loc.linkToArgs)#
        #hiddenFieldTag(name=loc.direction, value=params[loc.direction])#
        #hiddenFieldTag(name=loc.sort, value=params[loc.sort])#
        #textFieldTag(name=loc.search, value=params[loc.search], class="search-query", placeholder="Search #capitalize(pluralize(loc.modelName))#")#
        <strong>or</strong>
        #linkTo(route=loc.route, id="clear-search", text="View all #pluralize(loc.modelName)#", title="Reset Search", class="btn btn-info", argumentCollection=loc.linkToArgs)#
      #endFormTag()#
    </div>
  </cfif>
</cfoutput>
