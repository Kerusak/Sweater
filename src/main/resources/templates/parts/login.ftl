<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">User Name</label>
            <div class="col-sm-4">
                <input type="text" name="username" placeholder="Username" value="<#if user??>${user.username}</#if>"
                       class="form-control ${(usernameError??)?string('is-invalid','')}"/>
                <#if usernameError??>
                    <div class="invalid-feedback">
                        ${usernameError}
                    </div>
                </#if>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Password</label>
            <div class="col-sm-4">
                <input type="password" name="password" placeholder="Password"
                       class="form-control ${(passwordError??)?string('is-invalid','')}"/>
                <#if passwordError??>
                    <div class="invalid-feedback">
                        ${passwordError}
                    </div>
                </#if>
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Password</label>
                <div class="col-sm-4">
                    <input type="password" name="password2" placeholder="Retype password"
                           class="form-control ${(password2Error??)?string('is-invalid','')}"/>
                    <#if password2Error??>
                        <div class="invalid-feedback">
                            ${password2Error}
                        </div>
                    </#if>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-4">
                    <input type="email" name="email" value="<#if user??>${user.email}</#if>" placeholder="example@mail.com"
                           class="form-control ${(emailError??)?string('is-invalid','')}"/>
                    <#if emailError??>
                        <div class="invalid-feedback">
                            ${emailError}
                        </div>
                    </#if>
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <#if !isRegisterForm><a href="/registration">Add new user</a></#if>
        <button type="submit" class="btn btn-primary">Sign in</button>

    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <button type="submit" class="btn btn-primary" value="Sign Out">Sign Out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    </form>
</#macro>
