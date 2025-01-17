/*
 * This file is part of ThinkTwice.
 * 
 * Copyright (c) 2016 Antoine Drouhin <antoine.drouhin@gmail.com>, Geoffrey Harrazi <geoffreyharrazi@gmail.com>, Annas Saker
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

'use strict';

angular.module('thinktwiceApp')
    .service('uploadImage', function($timeout, $http,Upload){

        $http.defaults.headers.common.Authorization = window.localStorage.getItem("thinktwice_token");

        return function(file, path, callback){

            file.upload = Upload.upload({
                url     : path,
                method  : 'POST',
                file : file,
                fields : { type : file.type.split('/')[1]}
            });

            file.upload.then(function(response){
                $timeout(function () {
                    file.result = response.data;
                    return callback(true, response.data);
                });
            }, function(reason){
                // new ToastService(reason);
                return callback(false, response.data);
            });

            file.upload.progress(function(evt){
                file.progress = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
            })
        }

    });