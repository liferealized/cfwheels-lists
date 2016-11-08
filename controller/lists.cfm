<cffunction name="defaultListParams" access="public" output="false" returntype="void">
  <cfset filters(
        type="before"
      , through="$defaultListsParams"
      , only="index") />
</cffunction>

<cffunction name="defaultSort" access="public" output="false" returntype="void">
  <cfargument name="sort" type="string" required="true" />
  <cfargument name="direction" type="string" required="false" default="asc" />
  <!--- save our sort and direction in the class settings for later --->
  <cfset variables.$class.lists.sort = arguments.sort />
  <cfset variables.$class.lists.direction = arguments.direction />
  <cfset filters(type="before"
      , through="$defaultSort"
      , only="index"
      , placement="prepend") />
</cffunction>

<!--- private methods --->

<cffunction name="$defaultListsParams" access="public" output="false" returntype="void">
  <cfargument name="page" type="string" default="#$gls('params.page')#" />
  <cfargument name="sort" type="string" default="#$gls('params.sort')#" />
  <cfargument name="search" type="string" default="#$gls('params.search')#" />
  <cfargument name="direction" type="string" default="#$gls('params.direction')#" />

  <!--- param our necessary variables in the params scope --->
  <cfparam name="params.#arguments.search#" default="" />
  <cfparam name="params.#arguments.page#" default="1" />
  <cfparam name="params.#arguments.sort#" default="" />
  <cfparam name="params.#arguments.direction#" default="" />

  <cfscript>
    // make sure our page param is numeric and over 0
    if (!isNumeric(params[arguments.page])
        || params[arguments.page] lt 1)
      params[arguments.page] = 1;

    // make sure our direction is correct or default
    if (!listFindNoCase(",asc,desc", params[arguments.direction], ",", true))
      params[arguments.direction] = "";
  </cfscript>
</cffunction>

<cffunction name="$defaultSort" access="public" output="false" returntype="void">
  <cfargument name="sort" type="string" default="#$gls('params.sort')#" />
  <cfargument name="dir" type="string" default="#$gls('params.direction')#" />
  <cfscript>
    if (! structKeyExists(params, arguments.sort) || !len(params[arguments.sort]))
      params[arguments.sort] = variables.$class.lists.sort;
    if (! structKeyExists(params, arguments.dir) || !len(params[arguments.dir]))
      params[arguments.dir] = variables.$class.lists.direction;
  </cfscript>
</cffunction>

<cffunction name="$gls" access="public" output="false" returntype="string">
  <cfreturn $getListSetting(argumentCollection=arguments) />
</cffunction>

<cffunction name="$getListSetting" access="public" output="false" returntype="string">
  <cfargument name="setting" type="string" required="true" />
  <cfscript>
    local.finalValue = application.lists;
    local.depthArray = listToArray(arguments.setting, ".");

    for (local.item in local.depthArray)
      if (structKeyExists(local.finalValue, local.item))
        local.finalValue = local.finalValue[local.item];

    if (!isSimpleValue(local.finalValue))
      throw(type="Wheels.IncorrectSettingValue", message=arguments.setting);
  </cfscript>
  <cfreturn local.finalValue />
</cffunction>
