@extends('layouts.app')
@section('content')
<div class="container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Quản lý phim') }}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    @if(!isset($movie))
                    <form action="{{route('movie.store')}}" method="POST" enctype="multipart/form-data">
                        @else
                        <form action="{{route('movie.update', ['id' => $movie->id])}}" method="POST" enctype="multipart/form-data">
                            @endif
                            @csrf
                            <div>
                                <label>Tiêu đề</label>
                                <div>
                                    <input id="slug" name="title" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($movie->title) ? $movie->title : '' }}" onkeyup="ChangeToSlug()">
                                </div>
                            </div>
                            <div>
                                <label>Tên tiếng anh</label>
                                <div>
                                    <input name="name_eng" class="form-control" type="text" placeholder="Nhập tiêu đề" value="{{ isset($movie->name_eng) ? $movie->name_eng : '' }}">
                                </div>
                            </div>
                            <div>
                                <label>Trailer phim</label>
                                <div>
                                    <input name="trailer" class="form-control" type="text" value="{{ isset($movie->trailer) ? $movie->trailer : '' }}">
                                </div>
                            </div>
                            <div>
                                <label>Slug</label>
                                <div>
                                    <input id="convert_slug" name="slug" class="form-control" type="text" value="{{ isset($movie->slug) ? $movie->slug : '' }}">
                                </div>
                            </div>
                            <div>
                                <label>Thời lượng</label>
                                <div>
                                    <input name="thoiluong" class="form-control" type="text" value="{{ isset($movie->thoiluong) ? $movie->thoiluong : '' }}">
                                </div>
                            </div>
                            <div>
                                <label>Số tập phim</label>
                                <div>
                                    <input name="sotap" class="form-control" type="text" value="{{ isset($movie->sotap) ? $movie->sotap : '' }}">
                                </div>
                            </div>
                            <div>
                                <label>Mô tả</label>
                                <div>
                                    <textarea id="description" name="description" class="form-control" placeholder="Nhập nội dung" rows="10">{{ isset($movie->description) ? $movie->description : '' }}</textarea>
                                </div>
                            </div>
                            <div>
                                <label for="active">Hoạt động</label>
                                <div>
                                    <select name="status" class="form-control">
                                        <option value="1" @if(!empty($movie->status) && $movie->status == 1) checked @endif>Hiển thị</option>
                                        <option value="0" @if(!empty($movie->status) && $movie->status == 0) checked @endif>Ẩn</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label for="category">Danh mục</label>
                                <div>
                                    <select name="category_id" class="form-control">
                                        @if (!empty($category))
                                        @foreach ($category as $key => $value)
                                        <option value="{{ $key }}" @if(isset($movie->category_id) && $key == $movie->category_id) checked @endif>{{ $value }}</option>
                                        @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label for="genre">Thể loại</label><br/>
                                @foreach ($list_genre as $key => $gen)
                                    <input type="checkbox" name="genre[]" value="{{ $gen->id }}" @if(isset($movie->genre_id) && $gen->id == $movie->genre_id) checked @endif>
                                    <label for="genre">{{ $gen->title }}</label>
                                @endforeach
                            </div>
                            <div>
                                <label for="country">Quốc gia</label>
                                <div>
                                    <select name="country_id" class="form-control">
                                        @if (!empty($country))
                                        @foreach ($country as $key => $value)
                                        <option value="{{ $key }}" @if(isset($movie->country_id) && $key == $movie->country_id) checked @endif>{{ $value }}</option>
                                        @endforeach
                                        @endif
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label for="Hot">Hot</label>
                                <div>
                                    <select name="phim_hot" class="form-control">
                                        <option value="1" @if(!empty($movie->phim_hot) && $movie->phim_hot == 1) checked @endif>Có</option>
                                        <option value="0" @if(!empty($movie->phim_hot) && $movie->phim_hot == 0) checked @endif>Không</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label for="resolution">Định dạng</label>
                                <div>
                                    <select name="resolution" class="form-control">
                                        <option value="0" @if(!empty($movie->resolution) && $movie->resolution == 0) checked @endif>HD</option>
                                        <option value="1" @if(!empty($movie->resolution) && $movie->resolution == 1) checked @endif>SD</option>
                                        <option value="2" @if(!empty($movie->resolution) && $movie->resolution == 2) checked @endif>HDCam</option>
                                        <option value="3" @if(!empty($movie->resolution) && $movie->resolution == 3) checked @endif>Cam</option>
                                        <option value="4" @if(!empty($movie->resolution) && $movie->resolution == 4) checked @endif>FullHD</option>
                                        <option value="5" @if(!empty($movie->resolution) && $movie->resolution == 5) checked @endif>Trailer</option>


                                    </select>
                                </div>
                            </div>
                            <div>
                                <label for="phude">Phụ đề</label>
                                <div>
                                    <select name="phude" class="form-control">
                                        <option value="0" @if(!empty($movie->phude) && $movie->phude == 0) checked @endif>Vietsub</option>
                                        <option value="1" @if(!empty($movie->phude) && $movie->phude == 1) checked @endif>Thuyết minh</option>
                                    </select>
                                </div>
                            </div>
                            <div>
                                <label for="image">Hình ảnh</label>
                                <div>
                                    <input name="image" type="file" class="forn-controller-file">
                                </div>

                            </div>
                            @if(!isset($movie))
                            <button type="submit" class="btn btn-primary">Thêm dữ liệu</button>
                            @else
                            <button type="submit" class="btn btn-primary">Cập nhật</button>
                            @endif
                        </form>
                </div>
            </div>
            <table class="table" id="tablephim">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Tên phim</th>
                        <th scope="col">Tên quốc tế</th>
                        <th scope="col">Trailer</th>
                        <th scope="col">Thời lượng</th>
                        <th scope="col">Số tập</th>

                        <th scope="col">Hình ảnh</th>
                        <th scope="col">Phim hot</th>
                        <th scope="col">Định dạng</th>
                        <th scope="col">Phụ đề</th>

                        <!-- <th scope="col">Description</th> -->
                        <th scope="col">Tình trạng</th>
                        <th scope="col">Danh mục</th>
                        <th scope="col">Thể loại</th>
                        <th scope="col">Quốc gia</th>
                        </th>
                        <th scope="col">Quản lý</th>
                        <th scope="col">Ngày cập nhật</th>

                        <!-- <th scope="col">Top views</th> -->

                    </tr>
                </thead>
                <tbody>
                    @foreach($list as $key =>$cate)
                    <tr>
                        <th scope="row">{{$key}}</th>
                        <td>{{$cate->title}}</td>
                        <td>{{$cate->name_eng}}</td>
                        <td>{{$cate->trailer}}</td>

                        <td>{{$cate->thoiluong}}</td>
                        <td>{{$cate->sotap }}</td>


                        <td><img width="100px" src="{{asset('public/uploads/movie/'.$cate->image)}}"></td>
                        <!-- <td>{{$cate->description}}</td> -->
                        <td>
                            @if($cate->phim_hot==0)
                            Không
                            @else
                            Có
                            @endif
                        </td>
                        <td>
                            @if($cate->resolution==0)
                            HD
                            @elseif ($cate->resolution==1)
                            SD
                            @elseif ($cate->resolution==2)
                            HDCam
                            @elseif ($cate->resolution==3)
                            Cam
                            @elseif ($cate->resolution==4)
                            FullHD
                            @else
                            Trailer
                            @endif
                        </td>
                        <td>
                            @if($cate->phude==0)
                            Vietsub
                            @else
                            Thuyết minh
                            @endif
                        </td>
                        <td>
                            @if($cate->status)
                            Hiển thị
                            @else
                            Ẩn
                            @endif
                        </td>
                        <td>{{$cate->category->title}}</td>
                        <td>
                            @foreach ($cate->movie_genre as $gen)
                            <span class="badge badge-dark"> {{$gen->title}}</span><br/>
                            @endforeach
                        </td>
                        <td>{{$cate->country->title}}</td>
                        <td>
                            <form action="{{route('movie.destroy', ['id' => $cate->id])}}" method="POST">
                                @csrf
                                <button type="submit" class="btn btn-danger">Xóa</button>
                            </form>
                            <form action="{{route('movie.edit', ['id' => $cate->id])}}">
                                <button type="submit" class="btn btn-warning">Sửa</button>
                            </form>
                        </td>
                        <td>{{$cate->ngaycapnhat}}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@endsection