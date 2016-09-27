import 'whatwg-fetch';

<home>

      <form onsubmit={ search }>
        <label>
          <span>
            Search a movie
          </span>
          <!-- Textfield with Floating Label -->



          <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
          <input
                    oninput={ search }
                    onchange={ search }
                    name='s'
                    placeholder='28 Days Later..'
                    type='search' />

        </div>

        <div if={ results.length }>
          <table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
            <thead>
            <tr>
              <th class="mdl-data-table__cell--non-numeric">Title</th>
              <th>Year</th>
              <th>Details</th>
            </tr>
            </thead>
            <tbody>
            <tr each={ this.results }>
              <td class="mdl-data-table__cell--non-numeric">{ this.Title }</td>
              <td>{ this.Year }</td>
              <td>
                <a class="btn-floating btn-small waves-effect waves-light red"><i class="material-icons">more</i></a>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
          <p class='error' if={ error }>{ error }</p>

          <div if={ results.length }>
            <ul>
              <li each={ results }>
                <div class="card">
                  <div class="card-image waves-effect waves-block waves-light">
                    <img class="activator" src="{Poster}">
                  </div>
                  <div class="card-content">
                    <span class="card-title activator grey-text text-darken-4">{ Title }<i class="material-icons right">more_vert</i></span>
                    <p><a href="http://www.imdb.com/title/{ imdbID }">IMDB</a></p>
                  </div>
                  <div class="card-reveal">
                    <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                    <p>Here is some more information about this product that is only revealed once clicked on.</p>
                  </div>
                </div>




                <span>{ Year }</span>
              </li>
            </ul>
          </div>


  <script >
    this.lastSearch = null;
    this.error = false;
    this.results = [];
    /**
     * Reset tag attributes to hide the errors and cleaning the results list
     */
    this.resetData = function() {
      this.results = [];
      this.error = false;
    }

    this.on('mount', function() {
      var self = this;
      var restoredSession = JSON.parse(localStorage.getItem('movies'));
      self.results = restoredSession;
      self.update()
    });

    /**
     * Debounce the api requests
     */
    this.doApiRequest = function(search) {

      var self = this;
      var url = 'http://www.omdbapi.com/?s=' + search;
      fetch(url).then(function (response) {
        return response.json();
      }).then(function (data) {
        console.log(data);
        localStorage.setItem("movies", JSON.stringify(data.Search));
        console.log(localStorage.getItem("movies"));
        var restoredSession = JSON.parse(localStorage.getItem('movies'));
        console.log(restoredSession);
        self.results = restoredSession;
      }).catch(function () {
        console.log("Booo");
      });

    }
    /**
     * Public api/methods
     */



    /**
     * Search callback
     */
    this.search = function(e) {

      var search = this.s.value

      if (!search) {
        this.resetData()
      } else if (this.lastSearch != search && search.length > 1)  {
        this.resetData()
        this.isLoading = true
        this.doApiRequest(search)
      }

      this.lastSearch = search
    }
  </script>

</home>
