import places from 'places.js';

const initAutocomplete = () => {
    const addressInput = document.getElementById('boat-location');
    console.log(addressInput)
    if (addressInput) {
        places({ container: addressInput });
    }
};

export default initAutocomplete;