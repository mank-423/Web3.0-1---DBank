export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'CheckBalance' : IDL.Func([], [IDL.Float64], ['query']),
    'TopUp' : IDL.Func([IDL.Float64], [], ['oneway']),
    'Withdraw' : IDL.Func([IDL.Float64], [], ['oneway']),
    'compound' : IDL.Func([], [], ['oneway']),
  });
};
export const init = ({ IDL }) => { return []; };
