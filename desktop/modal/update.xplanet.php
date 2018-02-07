<?php
/* This file is part of Jeedom.
 *
 * Jeedom is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Jeedom is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Jeedom. If not, see <http://www.gnu.org/licenses/>.
 */
if (!isConnect('admin')) {
	throw new Exception('{{401 - Accès non autorisé}}');
}
?>
<div id='div_updatexplanetAlert' style="display: none;"></div>
<a class="btn btn-warning pull-right" data-state="1" id="bt_xplanetLogStopStart"><i class="fa fa-pause"></i> {{Pause}}</a>
<input class="form-control pull-right" id="in_xplanetLogSearch" style="width : 300px;" placeholder="{{Rechercher}}" />
<br/><br/><br/>
<pre id='pre_xplanetupdate' style='overflow: auto; height: 90%;with:90%;'></pre>


<script>
	$.ajax({
		type: 'POST',
		url: 'plugins/xplanet/core/ajax/xplanet.ajax.php',
		data: {
			action: 'updatexplanet'
		},
		dataType: 'json',
		global: false,
		error: function (request, status, error) {
			handleAjaxError(request, status, error, $('#div_updatexplanetAlert'));
		},
		success: function () {
			 jeedom.log.autoupdate({
			       log : 'xplanet_update',
			       display : $('#pre_xplanetupdate'),
			       search : $('#in_xplanetLogSearch'),
			       control : $('#bt_xplanetLogStopStart'),
           		});
		}
	});
</script>
