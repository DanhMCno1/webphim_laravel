<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Movie;
use App\Models\Movie_Genre;
use App\Models\Category;
use App\Models\Genre;
use App\Models\Country;
use App\Models\Episode;

use Carbon\Carbon;
use File;

class MovieController extends Controller 
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $list = Movie::with('category','movie_genre','country','genre')->orderBy('id','DESC')->get();
        // return response()->json($list);
        $path = public_path()."/json/";
        if (!is_dir($path)) {
            mkdir($path, 0777,true);
        }
        File::put($path.'movies.json',json_encode($list));

        return view('admin.movie.form',compact('list'));
    }
    public function update_topview(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['id_phim']);
        $movie->topview = $data['topview'];
        $movie->save();
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $category = Category::pluck('title','id');
        $genre = Genre::pluck('title','id');
        $country = Country::pluck('title','id');
        $list_genre = Genre::all();
        $list = Movie::orderBy('id','DESC')->get();
        return view ('admincp.movie.form',compact('list','genre', 'country', 'category','list_genre'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request -> all();
        $movie = new Movie();
        $movie->title = $data['title'];
        $movie->slug = $data['slug'];
        $movie->trailer = $data['trailer'];
        $movie->resolution = $data['resolution'];
        $movie->phude = $data['phude'];
        $movie->thoiluong = $data['thoiluong'];
        $movie->sotap = $data['sotap'];

        $movie->description = $data['description'];
        $movie->status = $data['status'];
        $movie->category_id = $data['category_id'];
        $movie->name_eng = $data['name_eng'];
        $movie->phim_hot = $data['phim_hot'];
        $movie->country_id = $data['country_id'];
        $movie->ngaytao = Carbon::now('Asia/Ho_Chi_Minh');
        $movie->ngaycapnhat = Carbon::now('Asia/Ho_Chi_Minh');
        foreach($data['genre'] as $key => $gen){
            $movie -> genre_id = $gen[0];
        }


        //them hinh anh 
        $get_image = $request -> file('image');
        $path = 'public/uploads/movie/';
        if($get_image){
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move($path,$new_image);
            $movie->image = $new_image;
        }
        $movie ->save();
        //them nhieu the loai cho phim 
        $movie->movie_genre()->attach($data('genre'));
        return redirect()-> back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $movie = Movie::find($id);
        $category = Category::pluck('title','id');
        $genre = Genre::pluck('title','id');
        $list_genre = Genre::all();
        $country = Country::pluck('title','id');
        $list = Movie::all();
        return view('admincp.movie.form',compact('list', 'movie', 'category','genre','country', 'list_genre'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request -> all();

        $movie = Movie::find($id);
        $movie -> title = $data['title'];
        $movie -> slug = $data['slug'];
        $movie->trailer = $data['trailer'];
        $movie->phude = $data['phude'];
        $movie->thoiluong = $data['thoiluong'];
        $movie->sotap = $data['sotap'];

        $movie->resolution = $data['resolution'];
        $movie -> description = $data['description'];
        $movie -> status = $data['status'];
        $movie -> category_id = $data['category_id'];
        $movie -> country_id = $data['country_id'];
        $movie->name_eng = $data['name_eng'];
        $movie->phim_hot = $data['phim_hot'];
        $movie->ngaycapnhat = Carbon::now('Asia/Ho_Chi_Minh');

        //them hinh anh 
        $get_image = $request -> file('image');
        $path = 'public/uploads/movie/';
        if($get_image){
            if(!empty($movie->image)) {
                unlink('public/uploads/movie/'.$movie->image);
            }
            $get_name_image = $get_image->getClientOriginalName();
            $name_image = current(explode('.', $get_name_image));
            $new_image = $name_image.rand(0,9999).'.'.$get_image->getClientOriginalExtension();
            $get_image->move($path,$new_image);
            $movie->image = $new_image;
        }
        foreach($data['genre'] as $key => $gen){
            $movie -> genre_id = $gen[0];
        }
        
        $movie -> save();
        $movie->movie_genre()->sync($data['genre']);
        return redirect()-> back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $movie = Movie::find($id);
        //xóa ảnh
        if(!empty($movie->image)) {
            unlink('public/uploads/movie/'.$movie->image);
        }
        //xóa thể loại 
        Movie_Genre::whereIn('movie_id', [$movie->id])->delete();
        // xoa tap phim
        Episode::whereIn('movie_id', [$movie->id])->delete();
        // $movie->delete();
        return redirect()-> back();

    }
}
