$(document).ready(function() {
    $('#allDemos').find('li').each(function(index, demoItem) {
        var $this = $(this);

        $this.find('button.show').click(function() {
            $(this).closest('li').find('pre').show();
            $(this).closest('li').find('button.hide').show();
            $(this).hide();
        });

        $this.find('button.hide').click(function() {
            $(this).closest('li').find('pre').hide();
            $(this).closest('li').find('button.show').show();
            $(this).hide();
        });
    });
});

function fixHeader() {
    $('#fixMyHeader').tableutils( {
        fixHeader: { width: 1000, height: 200 }
    } );

    $('#fixHeader').hide();
}

function sortRecords() {
    $('#sortMe').tableutils( {
        fixHeader: { width: 1000, height: 200 },
        sort: { type: [ 'alphanumeric', 'alphanumeric' , 'alphanumeric', 'numeric', 'alphanumeric'] },
        columns: [
            { label: 'First Name' },
            { label: 'Last Name' },
            { label: 'Concept' },
            { label: 'Rating' },
            { label: 'AKA' }
        ]
    } );

    $('#sortRecords').hide();
}

function searchRecords() {
    $('#search_received').tableutils( {
        fixHeader: { width: 1000, height: 200 },
        filter: true,
        columns: [
            { label: 'id' },
            { label: 'Message subject' },
            { label: 'Sender' },
            { label: 'Created at' }
        ]
    } );

    $('#searchRecords').hide();
}

function selectRecords() {
    $('#selectMyRecords').tableutils( {
        fixHeader: { width: 1000, height: 200 },
        masterCheckBox: { columnNumber: 1 },
        rowSelect: { columnIndex: 1 },
        columns: [
            { label: 'ID' },
            { label: 'First Name' },
            { label: 'Last Name' },
            { label: 'Concept' },
            { label: 'Rating' },
            { label: 'AKA' }
        ]
    } );

    $('#selectRecords').hide();
}

function paginate() {
    $('#paginateMe').tableutils( {
        fixHeader: { width: 1000, height: 200 },
        paginate: { type: 'numeric', pageSize: 2 },
        columns: [
            { label: 'First Name' },
            { label: 'Last Name' },
            { label: 'Concept' },
            { label: 'Rating' },
            { label: 'AKA' }
        ]
    } );

    $('#paginate').hide();
}
