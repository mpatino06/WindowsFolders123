function newFolder() {

	rowSelectLine = 0;
	var url = "/Folder/Add";

	$("#divModalFolderAdd").load(url, function () {
		$("#modalFolderAdd").modal("show");
	})

}


function newSubFolder() {

	rowSelectLine = 0;
	var url = "/Folder/AddSubFolder";

	$("#divModalSubFolderAdd").load(url, function () {
		$("#modalSubFolderAdd").modal("show");
	})

}

function saveFolder() {

	$("#IsSubFolder").val(false);
	var myformdata = $("#formFolderAdd").serialize();

	$("#loaderDiv").show();

	$.ajax({
		type: "POST",
		url: "/Folder/Save",
		data: myformdata,
		success: function (data) {

			if (data == true) {

				$("#modalFolderAdd").modal("hide");

				window.location.href = "/Folder/Index";
				alertify.set('notifier', 'position', 'top-center');
				alertify.success('Folder Guardada.');
			}

		},
		error: function () {
			alertify.set('notifier', 'position', 'top-center');
			alertify.error('Error al guardar Folder.');
		},
		complete: function (jqXHR, status) {
			$("#loaderDiv").hide();
		}
	});
}


function saveSubFolder() {


	var idFolder = $("#ParentId").val();
	$("#Parent").val(idFolder);
	$("#IsSubFolder").val(true);
	var myformdata = $("#formSubFolderAdd").serialize();

	$("#loaderDiv").show();

	$.ajax({
		type: "POST",
		url: "/Folder/Save",
		data: myformdata,
		success: function (data) {

			if (data == true) {

				$("#modalSubFolderAdd").modal("hide");

				window.location.href = "/Folder/Subfolder/" + idFolder;
				alertify.set('notifier', 'position', 'top-center');
				alertify.success('Folder Guardada.');
			}

		},
		error: function () {
			alertify.set('notifier', 'position', 'top-center');
			alertify.error('Error al guardar Folder.');
		},
		complete: function (jqXHR, status) {
			$("#loaderDiv").hide();
		}
	});
}


function subFolder(id) {

	window.location.href = "/Folder/Subfolder/" + id;
}

function subFiles(id) {

	window.location.href = "/File/Index/" + id;
}