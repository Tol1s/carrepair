<#import "/spring.ftl" as spring/>
<html>
<head>
    <title>Repairs</title>
</head>
<body>
    <h1>${errorMessage!""}</h1>
    <h2>Add Repair</h2>

    <form action="/admin/repairs/create" method="POST" id="repairForm" name="repairForm">
        <h4><i>Repair's Details</i></h4>
        <#--bind this form with the repair form fields-->
        <@spring.bind "repairForm.repairVehicleID"/>
        <label for="repairVehicleID">Vehicle's Plate Number</label>
        <input type="String" name="repairVehicleID" id="repairVehicleID" placeholder="ABE-1234" value="${repairForm.repairVehicleID!""}"/>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <br><br>
        <@spring.bind "repairForm.repairDate"/>
        <label for="repairDate">Scheduled Date</label>
        <input type="text" name="repairDate" id="repairDate" placeholder="2017/10/17" value="${repairForm.repairDate!""}"/>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <@spring.bind "repairForm.repairTime"/>
        <label for="repairTime">Scheduled Time</label>
        <input type="text" name="repairTime" id="repairTime" placeholder="10:00" value="${repairForm.repairTime!""}"/>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <br><br>
        <@spring.bind "repairForm.repairTypeID"/>
        <label for="repairTypeID">Types</label>
        <select id="repairTypeID" name="repairTypeID">
            <option value="1">Small Service</option>
            <option value="2">Great Service</option>
            <option value="3">Custom Service</option>
        </select>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <@spring.bind "repairForm.repairStatus"/>
        <label for="repairStatus">Status</label>
        <select id="repairStatus" name="repairStatus">
            <option value="Pending">Pending</option>
            <option value="In progress">In progress</option>
            <option value="Completed">Completed</option>
        </select>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <br><br>
        <@spring.bind "repairForm.repairTasks"/>
        <label for="repairTasks">Tasks</label>
        <textarea rows=4 cols=50 id="repairTasks" name="repairTasks" placeholder="Engine oil change, Oil filter replacement, Spark plugs Replacement" value="${repairForm.repairTasks!""}"> </textarea>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <br><br>
        <input type="submit" value="Create">
    </form>
    <hr></hr>
    <h2>Search Repair</h2>
    <form action="/admin/repairs/search" method="GET" id="repairSearchForm" name="repairSearchForm">
        <h4><i>Please provide the Repair ID, the Plate Number of the Vehicle or the Date</i></h4>
        <#--bind this field with the registration form fields-->
        <@spring.bind "repairSearchForm.repairID" />
        <label for="repairID">Repair ID</label>
        <input type="text" name="repairID" id="repairID" placeholder="1" value="${repairSearchForm.repairID!""}"/>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>

        <@spring.bind "repairSearchForm.repairDate"/>
        <label for="repairDate">Scheduled Repair Date</label>
        <input type="text" name="repairDate" id="repairDate" placeholder="2017/10/17" value="${repairSearchForm.repairDate!""}"/>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>

        <@spring.bind "repairSearchForm.repairVehicleID"/>
        <label for="repairVehicleID">Vehicle's Plate Number</label>
        <input type="text" name="repairVehicleID" id="repairVehicleID" placeholder="ABC-1234" value="${repairSearchForm.repairVehicleID!""}"/>
        <#list spring.status.errorMessages as error>
             <span>${error}</span>
        </#list>
        <br><br>
        <input type="submit" value="Search"/>
    </form>
<hr></hr>
    <h2>${searchNotFoundMessage!""}</h2>
    <#if repairsList??>
        <h3>Retrieved Repairs:</h3>
        <table>
            <tr>
                <th>Scheduled Date</th>
                <th>Scheduled Time</th>
                <th>Status</th>
                <th>Type</th>
                <th>Tasks</th>
                <th>Vehicle ID</th>
                <th>Edit Repair</th>
                <th>Delete Repair</th>
            </tr>
        <#list repairsList as repair>
        <span>
        <tr>
            <td>${repair.repairDate!}</td>
            <td>${repair.repairTime!}</td>
            <td>${repair.repairStatus!}</td>
            <td>${repair.repairTypeID!}</td>
            <td>${repair.repairTasks!}</td>
            <td>${repair.repairVehicleID!}</td>

            <form action="/admin/repairs/edit/${repair.repairID}" method="GET">
            <td> <input type="submit" value="Edit"> </td>
            <td>
                <button type="submit" formaction="/admin/repairs/delete/${repair.repairID}" formmethod="GET" onclick="return confirm('Are you sure?')">Delete</button>
            </td>
            </form>
        </tr>
        </span>
        </#list>
    </table>
    </#if>
    <script>
    function myFunction() {
        confirm("Are you sure to delete?");
    }
    </script>
</body>
</html>





