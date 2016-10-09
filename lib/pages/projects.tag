import RiotControl from 'riotcontrol';

<projects>
  <div class="row">
    <form class="col s12" onkeypress="return event.keyCode != 13">
      <div class="row">
        <div class="input-field col s6">
          <input id="first_name" type="text" class="validate">
          <label for="first_name">First Name</label>
        </div>
        <div class="input-field col s6">
          <input id="last_name" type="text" class="validate">
          <label for="last_name">Last Name</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="username" type="text" class="validate">
          <label for="username">Username</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="password" type="password" class="validate">
          <label for="password">Password</label>
        </div>
      </div>
    </form>

    <div  class="s12 l9 col">
      <div if= >
        <table  class="highlight">
          <thead>
          <tr>
            <th><h5>Roles</h5></th>
            </th>
          </tr>
          </thead>
          <tbody></tbody>
        </table>

        <ul class="collapsible" data-collapsible="accordion">
          <li each="{ name, i in roles }">
            <div class="collapsible-header"><i class="material-icons">mode_edit</i>{ name }</div>
            <div class="collapsible-body">
              <p>
                <a onclick={ onRemoveRole }
                   data-message={name}
                   class="waves-effect waves-light red btn">Remove</a>
              </p>
            </div>
          </li>
        </ul>
      </div>



      <div    class="row">
        <form  class="col s12">
          <div class="row">
            <div class="input-field col s4">
              <input   type="text" class="validate"
                       oninput = { onRoleChange }
                       onchange = { onRoleChange }
                       onkeypress = { onKeyPress }
                       name='r' >
              <label for="username">Role</label>
            </div>
            <div class="input-field col s3">
              <a id="addRoleButton"
                 disabled={ !isRoleAddable }
                 onclick="{onAddRole}"
                 class="waves-effect waves-light btn">Add</a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

  <script>

    var self = this;
    self.roles = ["Should","Never","See","This"]
    self.isRoleAddable = false;
    self.lastRole = null;



    this.on('mount', function() {
      console.log('mount',this)
      $('.collapsible').collapsible({
        accordion : false // A setting that changes the collapsible behavior to expandable instead of the default accordion style
      });

      var self = this;
      RiotControl.on('roles_changed', function(roles) {
        console.log('roles_changed',roles)
        self.roles = roles;
        self.update();
      });
      RiotControl.trigger('roles_fetch');
    });

    /**
     * Reset tag attributes to hide the errors and cleaning the results list
     */
    self.resetData = function() {
    }
    self.onRemoveRole = (e) =>{

      console.log('onRemoveRole',e,e.target.dataset.message)
      RiotControl.trigger('roles_remove',  e.target.dataset.message );
      self.collapseAll();
    }

    self.onAddRole = function() {
      console.log('onAddRole',self.lastRole)
      RiotControl.trigger('roles_add',self.lastRole);
      self.lastRole = "";
      self.r.value  = self.lastRole;
      self.isRoleAddable =  false;
    }
    /**
     * Search callback
     */
    self.onRoleChange = function(e) {
      console.log(self.r);
      var roleTerm = self.r.value
      self.isRoleAddable = false;

      if (roleTerm === undefined || !roleTerm) {
        self.resetData()
      } else if (this.lastRole != roleTerm && roleTerm.length > 1)  {
        self.resetData()
        self.isRoleAddable = true;
      }
      console.log(self.isRoleAddable)

      self.lastRole = roleTerm
    }
    self.onKeyPress = function(e) {
      if(!e)
        e=window.event;
      var keyCode = e.keyCode || e.which;
      console.log('onKeyPress',keyCode,e);
      if(keyCode== 13){
        event.preventDefault();
        if(self.isRoleAddable){
          self.onAddRole();
         }
        return false;
      }else{
        return true;
      }
    }


    self.collapseAll = () =>{
      $(".collapsible-header").removeClass(function(){
        return "active";
      });
      $(".collapsible").collapsible({accordion: true});
      $(".collapsible").collapsible({accordion: false});
    }

  </script>
</projects>

