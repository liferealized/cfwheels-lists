<cfoutput>
  #paginationLinks(
      windowSize = 5
    , showSinglePage = true
    , handle = arguments.modelName
    , alwaysShowAnchors = true
    , route = params.route
    , name = loc.page
    , argumentCollection=loc.paginationLinkToArgs)#
</cfoutput>
