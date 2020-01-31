//$(document).ready(function () {
//    $('.search').click(function (e) {
//        e.preventDefault();
//        var id = $("select[name='CategoryId']").val();
//        var loc = $("select[name='LocationId']").val();
//        let CategoryId = id;
//        let LocationId = loc;
//        var search_area = $(".search_area");

//        if (CategoryId != null) {
//            $.ajax({
//                url: "/Home/Search",
//                method: "get",
//                data: { LocationId: loc, CategoryId :id},
//                dataType: "json",
//                success: function (response) {
//                    console.log(response);
//                    search_area.empty();

//                    for (var i = 0; i < response.length; i++) {
//                        search_area.append(`
//                        <div class="job-list">
//                                        <div class="thumb">
//                                            <a href="#">
//                                                <img src="/Uploads/`+ response[i].Picture + `" class="img-fluid" alt="">
//                                            </a>
//                                        </div>
//                                        <div class="body">
//                                            <div class="content">
//                                                <h4><a href="@Url.Action("index", "jobdetail" , new {id=item.JobId, Area="" })">` + response[i].title + `</a></h4>
//                                                <div class="info">
//                                                    <span class="company"><a href="#"><i data-feather="briefcase"></i>` + response[i].Comp + `</a></span>
//                                                    <span class="office-location"><a href="#"><i data-feather="map-pin"></i>` + response[i].Loc + `</a></span>
                                                    
//                                                </div>
//                                            </div>
//                                            <div class="more">
//                                                <div class="buttons">
//                                                    <a href="@Url.Action("index", "jobdetail", new {id=item.JobId, Area="" })" class="button">@Resource.Details</a>
//                                                </div>
//                                                <p class="deadline">@Resource.Deadline: ` + response[i].Dead + ` @item.Job.Deadline.ToShortDateString()</p>
//                                            </div>
//                                        </div>
//                                    </div>
//                    `);
//                    }
//                },
//                error: function (error) {
//                    console.log(error);
//                }
//            });
//        }
//    });
//});