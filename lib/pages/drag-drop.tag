
import Sortable from '../js/Sortable.min.js';

<drag-drop>
    <ul id="list">
        <li style="cursor: pointer;" each={_items}>{name}</li>
    </ul>
    <hr>
    <div id="hlist">
        <span each={_items}>{name} | </span>
    </div>
    <hr>
    <ul id="listA">
        <li>foo 1</li>
        <li>foo 2</li>
        <li>foo 3</li>
    </ul>



    <ul id="listC"></ul>
    <hr>
    <button onclick={moveLastToFirst}>Move Last To First</button>
<style>
    ul {
        list-style: none;
        padding: 0;
    }

    li {
        background: #eee;
        margin: 1px;
        padding: 10px 15px;
        cursor: move;
        border-radius: 5px;
    }

    .sortable-ghost {
        opacity: .3;
        background: #f60;
    }


    #listC {
        border: 2px dashed #f60;
        min-height: 100px
    }
</style>
    <script>
        var self = this
        self._items = [
            { name: 'c#' },
            { name: 'swift' },
            { name: 'golang' },
            { name: 'python' },
            { name: 'javascript' }
        ]
        var sortableOption = {
            onEnd: function (evt) {
                console.log('move from', evt.oldIndex, 'to', evt.newIndex)
                self._items.splice(evt.newIndex, 0, self._items.splice(evt.oldIndex, 1)[0])
                var temp = self._items
                self._items = []
                self.update()
                self._items = temp
                self.update()
            }
        }
        var sortableSharedOption = {
            group: 'shared',
            onEnd: function (evt) {
                console.log(evt);
                console.log('move from', evt.oldIndex, 'to', evt.newIndex)
                self._items.splice(evt.newIndex, 0, self._items.splice(evt.oldIndex, 1)[0])
                var temp = self._items
                self._items = []
                self.update()
                self._items = temp
                self.update()
            }
        }
        this.moveLastToFirst = () =>{
            self._items.splice(0, 0, self._items.splice(self._items.length-1, 1)[0])
            console.log(self._items)
        }
        self.on('mount', function() {
            Sortable.create(self.list, sortableOption)
            Sortable.create(self.hlist, sortableOption)
            Sortable.create(self.listA, {
                group: {
                    name: 'shared',
                    pull: 'clone',
                    put: false,
                },
                sort: false

            });





            Sortable.create(self.listC, {
                group: 'shared',
                onAdd: function (evt) {
                    console.log(evt)
                    console.log('move from', evt.oldIndex, 'to', evt.newIndex)

                }
            });
        })
    </script>
</drag-drop>
