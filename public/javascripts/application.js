// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

    // Define the entry point
    $(document).ready(function()
    {
        alert("hey");
        $("#like").click(function(e){
            ratingClick("like", function(){
                getNextVideo()
            })
        })

        $("#dislike").click(function(e){
            ratingClick("like", function(){
                getNextVideo()
            })
        })

        getNextVideo()
    })

function ratingClick(rating, callback)
{
    //post the rating
    var viewingUpdateUrl = ""
    var params = ""
    $.post(viewingUpdateUrl, params, function(data){callback()})
    callback();

}

function setYouTube(playerId, youtubeId)
{
    var url = "http://www.youtube.com/embed/" + youtubeId
    $("#" + playerId).attr("src", url)
}

function getNextVideo()
{
    var currentId = videoIds[index];
    setYouTube("player", currentId);
}
