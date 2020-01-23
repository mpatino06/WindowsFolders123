function newFile() {

	rowSelectLine = 0;
	var url = "/File/Add";

	$("#divModalFileAdd").load(url, function () {
		$("#modalFileAdd").modal("show");
	})

}

function saveFile() {


	var idFolder = $("#ParentId").val();
	$("#FolderId").val(idFolder);
	var myformdata = $("#formFileAdd").serialize();

	$("#loaderDiv").show();

	$.ajax({
		type: "POST",
		url: "/File/Save",
		data: myformdata,
		success: function (data) {

			if (data == true) {

				$("#modalFileAdd").modal("hide");

				window.location.href = "/File/Index/" + idFolder;
				alertify.set('notifier', 'position', 'top-center');
				alertify.success('Folder Guardada.');
			}

		},
		error: function () {
			alertify.set('notifier', 'position', 'top-center');
			alertify.error('Error al guardar Archivo.');
		},
		complete: function (jqXHR, status) {
			$("#loaderDiv").hide();
		}
	});
}