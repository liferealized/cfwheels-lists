<cffunction name="list" access="public" output="false" returntype="any">
  <cfargument name="modelName" type="string" required="true" />
  <cfargument name="collection" type="query" required="true" />
  <cfargument name="properties" type="string" required="true" />
  <cfargument name="route" type="string" required="false" default="#pluralize(variables.params.route)#" />
  <cfargument name="doPagination" type="boolean" required="false" default="true" />
  <cfargument name="allowSearch" type="boolean" required="false" default="false" />
  <cfargument name="allowSort" type="boolean" required="false" default="true" />
  <cfargument name="allowEdit" type="boolean" required="false" default="true" />
  <cfargument name="allowDelete" type="boolean" required="false" default="true" />

  <!--- we need these settings as arguments to be able to override them per method call
        rather than on a per application basis --->
  <cfargument name="listPartial" type="string" required="false" default="#$gls("partials.list")#" />
  <cfargument name="listHeadPartial" type="string" required="false" default="#$gls("partials.listhead")#" />
  <cfargument name="listItemPartial" type="string" required="false" default="#$gls("partials.listitem")#" />
  <cfargument name="noListPartial" type="string" required="false" default="#$gls("partials.nolistitems")#" />
  <cfargument name="searchPartial" type="string" required="false" default="#$gls("partials.search")#" />
  <cfargument name="paginationPartial" type="string" required="false" default="#$gls("partials.pagination")#" />

  <cfargument name="$baseTemplatePath" type="string" required="false" default="plugins/lists" />
  <cfscript>
    // get our setting for the search param name
    arguments.search = $getListSetting("params.search");
    arguments.page = $getListSetting("params.page");
    arguments.direction = $getListSetting("params.direction");
    arguments.sort = $getListSetting("params.sort");

    // get our rendering settings to use in our partials
    arguments.settings.tc= $getListSetting("rendering.table.class");

    arguments.linkToArgs = {};
    arguments.model = model(arguments.modelName);
    arguments.properties = ListToArray(arguments.properties);
    arguments.paginationLinkToArgs = {};

    for (local.arg in arguments) {

      if (right(local.arg, 3) == "key") {
        arguments.linkToArgs[local.arg] = arguments[local.arg];
        arguments.paginationLinkToArgs[local.arg] = arguments[local.arg];
      }
    }

    if (arguments.allowSearch) {

      if (structKeyExists(variables.params, arguments.search)
          and len(variables.params[arguments.search])) {
        arguments.paginationLinkToArgs["params"] = "#arguments.search#=";
        arguments.paginationLinkToArgs["params"] &= variables.params[arguments.search];
      }
    }

    return includePartial(
        partial=arguments.listPartial
      , argumentCollection=arguments);
  </cfscript>
</cffunction>

<cffunction name="sortLinkTo" access="public" output="false" returntype="string">
  <cfargument name="modelName" type="string" required="true" />
  <cfargument name="property" type="string" required="true" />
  <cfargument name="route"  type="string"required="true" />
  <cfargument name="params" required="false" default="#variables.params#" />
  <cfscript>
    // get our model object to help with formatting
    local.model = model(arguments.modelName);

    // get our param names from settings
    local.sort = $getListSetting("params.sort");
    local.direction = $getListSetting("params.direction");

    // get our icons settings for rendering
    local.iconUp = $getListSetting("rendering.sorting.icons.up");
    local.iconDn = $getListSetting("rendering.sorting.icons.down");

    // default out text and title
    local.text = local.model.$label(arguments.property);
    local.title = trim(stripTags(local.text));

    // end users have the ability to override text display with a helper function
    local.formatMethod = "format#arguments.modelName##arguments.property#Label";

    if (structKeyExists(variables, local.formatMethod))
      local.text = $invoke(method=local.formatMethod);

    // return just the text if we don't allow sorting
    if (!arguments.allowSort)
      return local.text;

    // are we on the currently shorted column
    local.d = "asc";
    if (arguments.params[local.sort] == arguments.property) {

      local.d = (arguments.params[local.direction] == "asc") ? "desc" : "asc";

      if (arguments.params.d == "asc")
        local.text &= " " &  $element(
            name="span"
          , attributes={ class="#local.iconUp#" });
      else
        local.text &= " " & $element(
            name="span"
          , attributes={ class="#local.iconDn#" });
    }

    // display the link
    return linkTo(
        route=arguments.route
      , text=local.text
      , title=local.title
      , params="s=#arguments.property#&d=#local.d#");
  </cfscript>
</cffunction>
