<cfoutput>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-12 pull-right">
        #bPaginationLinks(
            windowSize = 5
          , showSinglePage = true
          , handle = arguments.modelName
          , alwaysShowAnchors = true
          , route = params.route
          , name = "p"
          , argumentCollection=loc.paginationLinkToArgs)#
      </div>
    </div>
  </div>
</cfoutput>
