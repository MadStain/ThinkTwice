/*
 * This file is part of ThinkTwice.
 * 
 * Copyright (c) 2016 Antoine Drouhin <antoine.drouhin@gmail.com>, Geoffrey Harrazi <geoffreyharrazi@gmail.com>, Annas Saker
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

var TtmatchController = exports;



//--------------------------------------- Module dependencies.

var     moment          = require('moment'),
        Utils           = require('../helpers/appUtils'),
        Ttmatch    = require("../models/ttmatch.js");

/**
 * Load all people
 * @param req
 * @param res
 */
TtmatchController.getMatch = function(req, res){

    Utils.info("Get Match");

    if (req.id_p_cur) {

        //TODO mettre le dernier match (Ajouté condition WHERE DatE la plus récente)
        var query = "select id, personneid1, personneid2 from ttmatch where personneid1 = ? or personneid2 = ?";

        var con = global.con();

        con.query(query, [req.id_p_cur, req.id_p_cur], function(err, rows) {
            if (err) {
                Utils.info(err);
                res.status(400).json({error : true});
                return;
            }


            var json;
            if (!rows.length) {
                json = TtmatchController.matching(req.id_p_cur);
                return;
            }
            else {
                var matchPersonId = rows[0].personneid1 == req.id_p_cur ? rows[0].personneid2 : rows[0].personneid1;

                json = {
                    id : rows[0].id,
                    matchPersonId : matchPersonId
                };
            }

            if(typeof json.nomatch != "undefined" && json.nomatch ) {
                res.status(400).json(json);
            };
            
            res.status(200).json(json);
            return;

        });



    } else {
        Utils.info("Error during get match");
    }
};

TtmatchController.deleteMatch = function(req, res){

    Utils.info("DELETE Match");

    if (req.params.id) {

        var query = "DELETE from ttmatch where personneid1 = ? or personneid2 = ?";

        var con = global.con();

        con.query(query, [req.params.id, req.params.id], function(err, rows) {
            if (err) {
                Utils.info(err);
                res.status(400).json({error : true});
                return;
            }

            res.status(200).json({error: false});

        });

    } else {
        Utils.info("Error during delete match");
    }
    
};

TtmatchController.matching = function(pid) {
    var t = new Ttmatch(pid);

    //TODO Geof, ta fonction doit return un json, appelle moi pour te donner le format
    return t.matching();
}


