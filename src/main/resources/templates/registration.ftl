<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
<h2>Add new user</h2>
${message!}
<@l.login "/registration" true/>
</@c.page>