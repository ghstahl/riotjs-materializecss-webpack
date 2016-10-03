
import Sortable from '../js/Sortable.min.js';

<drag-drop2>

        <ul class="collection" id="roleA">
            <li each={_itemsRoleA} data-role="{name}" class="collection-item">
                 {name}
            </li>
        </ul>
        <ul class="collection" id="roleB">
            <li each={_itemsRoleB} data-role="{name}" class="collection-item">
                {name}
            </li>
        </ul>
        <ul class="collection" id="roleFinal">
            <li each={_itemsRoleFinal} class="collection-item avatar">

                <img src="images/graduation.png" alt="" class="circle">
                <span class="title">{name}</span>
                <p>First Line <br>
                    Second Line
                </p>
                <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a>
            </li>

        </ul>

        <button class="btn waves-effect waves-light" onclick="{updateRoles}"  >Submit</button>


    <!-- Modal Structure -->
    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>Modal Header</h4>
            <p>A bunch of text</p>
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Agree</a>
        </div>
    </div>
    <a href="#modal1" data-toggle="modal" class=" modal-trigger waves-effect waves-light blue accent-2 white-text btn">Add Comment</a>
    <!-- Modal Trigger -->
    <button data-target="modal1" class="btn waves-effect waves-light modal-trigger">Modal</button>
    <style >



    .sortable-ghost {
        opacity: .3;
        background: #f60;
    }


    #roleA,#roleB,#roleFinal {
        border: 2px dashed #f60;
        min-height: 100px
    }

</style>
    <script>
        var self = this

        self.updateRoles = () =>{

            console.log(self.roleFinal)
        }

        self.inPlayItem = null;

        self._itemsRoleA = [
            { name: 'Administrator' },
            { name: 'Developer' },
            { name: 'User' }
        ]
        self._itemsRoleB = [
            { name: 'Dog' },
            { name: 'Cat' },
            { name: 'Mouse' }
        ]
        self._itemsRoleFinal = [
            { name: 'Administrator' }
        ]

        self.emptyUL = (ul) => {

            var lis = ul.getElementsByTagName("li");
            while(lis.length> 0){
                ul.removeChild(lis[0]);
                lis = ul.getElementsByTagName("li");
            }
        }
        self.on('mount', function() {
            // the "href" attribute of .modal-trigger must specify the modal ID that wants to be triggered
            $('.modal-trigger').leanModal();

            Sortable.create(self.roleA, {
                group: {
                    name: 'roles',
                    pull: 'clone',
                    put: false
                },
                sort:false,
                onStart: function (/**Event*/evt) {
                    var newItem = self._itemsRoleA[evt.oldIndex];
                    self.inPlayItem = newItem;
                }
            });
            Sortable.create(self.roleB, {
                group: {
                    name: 'roles',
                    pull: 'clone',
                    put: false
                },
                sort:false,
                onStart: function (/**Event*/evt) {
                    var newItem = self._itemsRoleB[evt.oldIndex];
                    self.inPlayItem = newItem;
                }
            });
            Sortable.create(self.roleFinal, {
                group: {
                    name: 'roles',
                    pull: false
                },
                sort:false,
                onAdd: function (evt) {
                    var el = evt.item;
                    var roleName = el.getAttribute("data-role");
                    console.log(roleName);

                    // is it in our backing array
                    var item = self._itemsRoleFinal.find(x => x.name === roleName);
                    if (item) {
                        console.log("This item already exists");
                    }
                    else {
                        self._itemsRoleFinal.push(self.inPlayItem);
                    }
                    self.emptyUL(self.roleFinal);
                    var temp = self._itemsRoleFinal;
                    self._itemsRoleFinal = [];
                    self.update();
                    self._itemsRoleFinal = temp;
                    self.update();
                }
            });
        })
    </script>
</drag-drop2>
