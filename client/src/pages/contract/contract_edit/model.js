import { message } from 'antd';
import { getOneContract } from '@/services/contract';

export default {
    namespace : 'contractEdit',

    state: {
        editdata: {},
    },
    effects: {
        *queryGetOneCon({payload}, {call,put}) {
            const response = yield call(getOneContract, payload);
            console.log(response);
            yield put({type: 'updataData', payload: response});
        },
    },
    reducers: {
        updataData(state, action) {
            return {
                ...state,
                editdata: action.payload,
            }
        }
    }
};