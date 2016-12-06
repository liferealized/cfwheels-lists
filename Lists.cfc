<cfcomponent output="false" mixins="controller">

  <cffunction name="init" access="public" output="false" returntype="any">
    <cfscript>
      this.version = "1.4.5,2.0";
      return this;
    </cfscript>
  </cffunction>

  <!--- include all of our methods for invoking and rendering lists --->
  <cfinclude template="events/onapplicationstart.cfm" />
  <cfinclude template="controller/lists.cfm" />
  <cfinclude template="view/lists.cfm" />
  <cfinclude template="view/miscellaneous.cfm" />


</cfcomponent>
