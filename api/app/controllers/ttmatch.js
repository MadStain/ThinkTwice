/**
 * Created by Geoffrey on 7/1/2016.
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

    if (req.params.id) {

        var query = "select id, personneid1, personneid2 from ttmatch where personneid1 = ? or personneid2 = ?";

        var con = global.con();

        con.query(query, [req.params.id, req.param.id], function(err, rows) {
            if (err) {
                Utils.info(err);
                res.status(400).json({error : true});
                return;
            }


            var json;
            if (!rows.length) {
                json = TtmatchController.matching(req.body.id);
                return;
            }
            else {
                var matchPersonId = rows[0].personneid1 == req.param.id ? rows[0].personneid2 : rows[0].personneid1;
                TtmatchController.retMatch(id, matchProfilId);

                json = {
                    id : id,
                    matchProfilId : matchPersonId
                };
            }

            res.status(200).json(json);
            return;

        });



    } else {
        Utils.info("Error during get match");
    }
};

TtmatchController.matching = function(pid) {
    var t = new Ttmatch(pid);

    //TODO Geof, ta fonction doit return un json, appelle moi pour te donner le format
    return t.matching();
}


