<cffunction name="includePartial" returntype="string" access="public" output="false">
  <cfargument name="partial" type="any" required="true">
  <cfargument name="group" type="string" required="false" default="">
  <cfargument name="cache" type="any" required="false" default="">
  <cfargument name="layout" type="string" required="false">
  <cfargument name="spacer" type="string" required="false">
  <cfargument name="dataFunction" type="any" required="false">
  <cfargument name="$prependWithUnderscore" type="boolean" required="false" default="true">
  <cfscript>
    local.defaultPartials = [
        "/partials/list"
      , "/partials/listhead"
      , "/partials/listitem"
      , "/partials/nolistitems"
      , "/partials/pagination"
      , "/partials/search"
    ];

    if (structKeyExists(arguments, "$baseTemplatePath")) {

      if (!listFindNoCase(arrayToList(local.defaultPartials), arguments.partial))
        arguments.$baseTemplatePath = get("viewPath");
      else
        arguments.$baseTemplatePath = "plugins/lists";
    }
  </cfscript>
  <cfreturn core.includePartial(argumentCollection=arguments) />
</cffunction>
